# frozen_string_literal: true

module Sortable
  extend ActiveSupport::Concern

  def self.included(base)
    base.class_eval do
      #==========================================================================
      # Création d'un scope de tri par colonne de la table
      # Utilisation :
      #   User.sort_by_lastname("desc") => Tri décroissant du nom de la personne
      #==========================================================================
      (begin
         base.column_names
       rescue
         []
       end).each do |column|
        # Le rescue est nécessaire dans le cas de l'installation du projet où
        # la table n'existe pas encore sinon le rake db:migrate ne passe pas
        scope "sort_by_#{column}", ->(order) {
          field = arel_table[column]
          # on traite les colonnes de type string en lowercase car postgresql est sensible à la casse
          field = field.lower if columns_hash[column].type == :string
          arel_order = order.to_s.casecmp('desc').zero? ? Arel::Nodes::Descending.new(field) : Arel::Nodes::Ascending.new(field)
          order(arel_order)
        }
      end

      #==========================================================================
      # Application des filtres de tri à l'envoi d'un params[:sort]
      # (à coupler avec l'utilisation du helper hm_sort)
      # Utilisation :
      #   User.apply_sorts(params, lastname: :asc) => Si pas de sort, tri par nom par défaut
      #==========================================================================
      def self.apply_sorts(params, default = { id: :asc })
        if params[:sort].present?
          field, dir = params[:sort].split(/\s*,\s*/).first.split /\s+/
          klass = send(field, dir)
        else
          # tri par défaut
          klass = order(default)
        end
      end
    end
  end
end

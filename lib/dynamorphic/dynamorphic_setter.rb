module Dynamorphic
  module DynamorphicSetter
    extend ActiveSupport::Concern

    included do
    end

    module ClassMethods
      def belongs_to_dynamorphic(model)
        define_method "#{model}=" do |args|
          update("#{model}_type" => args.class.name, "#{model}_id" => args.id)
        end

        define_method "#{model}" do
          if self.send("#{model}_type") && self.send("#{model}_id")
            self.send("#{model}_type").constantize.find(self.send("#{model}_id"))
          end
        end
      end

      def has_many_dynamorphic(pluralized_model, *args)
        define_method "#{pluralized_model}" do
          singular_model_name = pluralized_model.to_s.singularize
          model = singular_model_name.camelize.constantize
          foreign_association_name = args.first[:as]

          model.where(
            "#{foreign_association_name}_type" => self.class.name,
            "#{foreign_association_name}_id" => self.id
          )
        end

        define_method "add_#{pluralized_model}" do |object|
          singular_model_name = pluralized_model.to_s.singularize
          model = singular_model_name.camelize.constantize
          foreign_association_name = args.first[:as]

          if object.is_a?(Array)
            object.each do |single_object|
              single_object.update(
                "#{foreign_association_name}_type" => self.class.name,
                "#{foreign_association_name}_id" => self.id
              )
            end
          else
            object.update(
              "#{foreign_association_name}_type" => self.class.name,
              "#{foreign_association_name}_id" => self.id
            )
          end
        end
      end
    end
  end
end

ActiveRecord::Base.send :include, Dynamorphic::DynamorphicSetter

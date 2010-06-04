# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'
begin; require 'ruby-debug' if Rails.env=="development"; rescue; end

class ExtraVariantExtension < Spree::Extension
  version "0.5"
  description "Add free-form text variants to your products without having to create all the different possibilities in your database"
  url "http://github.com/cmer/spree-extra-variant"

  def activate
    OrdersController.class_eval do
      alias :create_before_without_extra_variant :create_before
      def create_before
        Thread.current[:extra_variant] = params[:extra_variant] if params[:extra_variant]
        return create_before_without_extra_variant
      end
    end


    Order.class_eval do
      alias :contains_without_extra_variant? :contains?
      def contains?(variant)
        return contains_without_extra_variant?(variant) unless Thread.current[:extra_variant]
        line_items.select { |line_item| line_item.variant == variant && line_item.extra_variant == Thread.current[:extra_variant] }.first
      end

      alias :add_variant_without_extra_variant :add_variant  
      def add_variant(variant, quantity=1)
        current_item = add_variant_without_extra_variant(variant, quantity)

        if Thread.current[:extra_variant]
          current_item.extra_variant = Thread.current[:extra_variant]
          Thread.current[:extra_variant] = nil
          current_item.save!
        end

        current_item
      end
    end

  end
end

module ApplicationHelper
   def link_to_add_row(rkpurchprodname, f, association, **args)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize, f: builder)
    end
    link_to(rkpurchprodname, '#', class: "add_fields " + args[:class], data: {id: id, fields: fields.gsub("\n", "")})
  end

  def link_to_add_row(product_id, f, association, **args)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize, f: builder)
    end
    link_to(product_id, '#', class: "add_fields " + args[:class], data: {id: id, fields: fields.gsub("\n", "")})
  end


  def is_active_controller(controller_name, class_name = nil)
      if params[:controller] == controller_name
       class_name == nil ? "active" : class_name
      else
         nil
      end
  end
  def is_active_action(action_name)
      params[:action] == action_name ? "active" : nil
  end
end

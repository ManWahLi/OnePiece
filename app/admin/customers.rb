ActiveAdmin.register Customer do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :full_name, :phone_number, :email_address, :notes
  #
  # or
  #
  # permit_params do
  #   permitted = [:full_name, :phone_number, :email_address, :notes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.semantic_errors
    f.inputs
    f.inputs do
      # f.input :image, as: :file
      # condition + ternary operator
      # CSS can only change how images are displayed but not their sizes
      f.input :image, as:   :file,
                      hint: f.object.image.present? ? image_tag(f.object.image.variant(resize_to_limit: [500, 500])) : ""
    end
    f.actions
  end
end

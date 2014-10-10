ActiveAdmin.register Upload do


  filter :title
  filter :notes
  filter :created_at
  filter :updated_at


  permit_params do
    permitted = [:title, :notes, :file]
    permitted
  end


  form html: { multipart: true } do |f|
    f.inputs "Uploads" do
      f.input :title
      f.input :notes
      f.input :file, as: :file
    end
    f.actions
  end

  index do
    column :id
    column :title
    column :notes
    column :payments_count
    column :created_at
    actions
  end

end

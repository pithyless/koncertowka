ActiveAdmin.register Venue do
  controller.authorize_resource

  filter :name
  filter :address_street
  filter :city

  index do
    column "Name" do |venue|
      link_to venue.name, admin_venue_path(venue)
    end
    column :description
    column :city_name
    column :address_street
    default_actions
  end

  form do |f|
    f.inputs "Venue details" do
      f.input :name
      f.input :description
      f.input :address_street
      f.input :address_postal_code
      f.input :city
    end
    f.buttons
  end
end

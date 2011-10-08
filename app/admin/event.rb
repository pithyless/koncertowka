ActiveAdmin.register Event do
  controller.authorize_resource

  filter :title
  filter :description
  filter :start_at

  index do
    column "Title" do |venue|
      link_to venue.title, admin_venue_path(venue)
    end
    column :description
    column :venue
    column :start_at
    column :end_at
    column :promoter
    default_actions
  end

  form do |f|
    f.inputs "Venue details" do
      f.input :title
      f.input :description
      f.input :venue
      f.input :start_at
      f.input :end_at
      f.input :promoter
    end
    f.buttons
  end
end

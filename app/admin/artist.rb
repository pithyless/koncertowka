ActiveAdmin.register Artist do
  controller.authorize_resource

  filter :name

  # index :as => :grid, :columns => 5 do |photo|
  #   link_to(image_tag(photo.image.square), "/admin/photos/#{photo.id}")
  #   # TODO: AA bug -> admin_photos_path(photo) => "/admin/photos.7"
  # end

  index do
    column "Name" do |artist|
      link_to artist.name, admin_artist_path(artist)
    end
    column :tagline
    column :created_at
    default_actions
  end

  form do |f|
    f.inputs "Artist details" do
      f.input :name
      f.input :tagline
      f.input :description
    end
    f.buttons
  end
end

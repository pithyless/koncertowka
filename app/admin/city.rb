ActiveAdmin.register City do
  controller.authorize_resource

  filter :city
end

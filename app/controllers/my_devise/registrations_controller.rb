class MyDevise::RegistrationsController < Devise::RegistrationsController
  def create
    super
    if resource.save
      @permission = Permission.new
      @permission.user_id = resource.id
      @permission.role_id = 4 || 3
      if @permission.save
        articles_path
      else
        errors_path
      end
    end
  end
end
module V1
  module ResourceDefinitions
    class Users
      include Praxis::ResourceDefinition

      version '1.0'
      media_type MediaTypes::User
      description <<-EOS
Represents a user of the system. Users may own blogs and author posts.

The API allows only retrieving information of users, either by listing them all
or by retrieving details of a specific user.
EOS

      action :index do
        description 'Retrieve a listing of all users.'
        routing { get '' }
        response :ok, media_type: Praxis::Collection.of(MediaTypes::User)
      end

      action :show do
        description 'Retrieve details of a specific user by id.'
        routing { get '/:id' }
        params do
          attribute :id
        end
        response :ok
        response :resource_not_found
      end

    end
  end
end

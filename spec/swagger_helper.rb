# frozen_string_literal: true

require 'rails_helper'

RSpec.configure do |config|
  config.swagger_dry_run = false
  # Specify a root folder where Swagger JSON files are generated
  # NOTE: If you're using the rswag-api to serve API descriptions, you'll need
  # to ensure that it's configured to serve Swagger from the same folder
  config.swagger_root = Rails.root.join('swagger').to_s

  # Define one or more Swagger documents and provide global metadata for each one
  # When you run the 'rswag:specs:swaggerize' rake task, the complete Swagger will
  # be generated at the provided relative path under swagger_root
  # By default, the operations defined in spec files are added to the first
  # document below. You can override this behavior by adding a swagger_doc tag to the
  # the root example_group in your specs, e.g. describe '...', swagger_doc: 'v2/swagger.json'
  config.swagger_docs = {
    'v1/swagger.json' => {
      swagger: '2.0',
      info: {
        title: 'API V1',
        version: 'v1'
      },
      basePath: '/api/v1',
      paths: {},
      definitions: {
        login: {
          type: :object,
          properties: {
            email: { type: :string },
            password: { type: :string }
          },
          required: %w[email password],
          example: {
            sign_in: {
              email: 'sample@email.com',
              password: 'Abcd#1234'
            }
          }
        },
        account_change_password: {
          type: :object,
          properties: {
            old_password: { type: :string },
            password: { type: :string },
            confirm_password: { type: :string }
          },
          required: %w[first_name last_name email mobile],
          example: {
            "account": {
              old_password: 'P4ssw0rd#!',
              password: 'w0rdP4ss#!',
              password_confirmation: 'w0rdP4ss#!'
            }
          }
        },
        account_update: {
          type: :object,
          properties: {
            first_name: { type: :string },
            last_name: { type: :string },
            mobile: { type: :string }
          },
          example: {
            "account": {
              first_name: 'Samuel',
              last_name: 'Black',
              mobile: '+33 4 55 44 33'
            }
          }
        },
        sign_up: {
          type: :object,
          properties: {
            email: { type: :string },
            password: { type: :string },
            name: { type: :string },
            mobile: { type: :string }
          },
          required: %w[email password name mobile],
          example: {
            sign_up: {
              email: 'sample@email.com',
              password: 'Abcd#1234',
              name: 'Samuel Black',
              mobile: '+33 4 55 44 33'
            }
          }
        },
        queue: {
          type: :object,
          properties: {
            name: { type: :string },
            priority: { type: :string }
          },
          required: %w[name priority],
          example: {
            queue: {
              name: 'Critical Queue',
              priority: 'critical'
            }
          }
        },
        job: {
          type: :object,
          properties: {
            name: { type: :string },
            priority: { type: :string },
            job_klass: { type: :string },
            arguments: { type: :array }
          },
          required: %w[name priority job_klass],
          example: {
            job: {
              name: 'Queue Job',
              priority: 'high',
              job_klass: 'StoreMovies',
              arguments: %w[filepath_to_fetch_titles_from]
            }
          }
        }
      },
      securityDefinitions: {
        bearerAuth: {
          type: 'apiKey',
          scheme: 'bearer',
          bearerFormat: 'JWT',
          in: 'header',
          description: 'JWT Authorization header using the Bearer scheme. Example: Authorization: Bearer {token}',
          name: 'Authorization'
        }
      }
    }
  }

  # Specify the format of the output Swagger file when running 'rswag:specs:swaggerize'.
  # The swagger_docs configuration option has the filename including format in
  # the key, this may want to be changed to avoid putting yaml in json files.
  # Defaults to json. Accepts ':json' and ':yaml'.
  config.swagger_format = :json
end

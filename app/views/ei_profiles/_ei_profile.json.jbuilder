json.extract! ei_profile, :id, :ei_user_id, :profile_picture, :first_name, :last_name, :email, :phone_number, :current_position, :work_start_date, :created_at, :updated_at
json.url ei_profile_url(ei_profile, format: :json)

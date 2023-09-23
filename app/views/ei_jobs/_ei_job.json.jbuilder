json.extract! ei_job, :id, :ei_user_id, :position, :job_description, :salary, :deadline, :created_at, :updated_at
json.url ei_job_url(ei_job, format: :json)

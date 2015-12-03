json.array!(@jobs) do |job|
  json.extract! job, :id, :user_id, :company_name, :job_title
  json.url job_url(job, format: :json)
end

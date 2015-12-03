class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.references :user, index: true, foreign_key: true
      t.string :company_name
      t.string :job_title

      t.timestamps null: false
    end
  end
end

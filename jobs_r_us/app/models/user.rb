class User < ActiveRecord::Base
  has_many :jobs

  def self.search(first_name, last_name)
    where_clauses = []
    fields = []

    if first_name.present?
      where_clauses.push('first_name LIKE ?')
      fields.push("%#{first_name}%")
    end

    if last_name.present?
      where_clauses.push('last_name LIKE ?')
      fields.push("%#{last_name}%")
    end

    where(
      where_clauses.join(' OR '),
      *fields
    )
  end

  # params[:first_name]
  # @users = User.first(10)
  # @users = User.where(first_name: "Don")
  # @users = User.where('first_name LIKE ?',
  #   '%' + params[:first_name] + '%'
  #   ).where(dead: false)
  # render 'index'

  # @users = User.alive.search(
  # params[:first_name],
  # params[:last_name]
  # ).order(:last_name).offset(10).limit(20)
  # render 'index'

  def self.alive
    where(dead: false)
  end
end

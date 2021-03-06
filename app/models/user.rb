class User < ReqTree::Base
  # Include default devise modules. Others available are:
  # :confirmable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable

  validates :first_name, presence: true, allow_blank: false
  validates :email, presence: true, allow_blank: false
  validates :encrypted_password, presence: true, allow_blank: false

  def name
    last_name ? "#{first_name} #{last_name}" : first_name
  end
end

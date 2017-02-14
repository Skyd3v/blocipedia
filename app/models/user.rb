class User < ActiveRecord::Base
    has_many :wikis, dependent: :destroy
    has_many :collaborations
    has_many :shared_wikis, through: :collaborations, source: :wiki
    before_save { self.email = email.downcase if email.present? }
    after_initialize :init
    enum role: [:member, :admin, :premium]

    def init
        self.role ||= :member
  end
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable
end

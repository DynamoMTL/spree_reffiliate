module Spree
  class Referral < Spree::Base
    belongs_to :user, class_name: Spree.user_class.to_s
    has_many :referred_records

    validates_presence_of :user_id, :code

    before_validation :attach_code, on: :create

    def referred_users
      referred_records.includes(:user).collect(&:user).compact
    end

    def referred_orders
      referred_records.includes({:user => :orders}).collect{|u| u.user.orders }.flatten.compact
    end

    protected
      def attach_code
        self.code = loop do
          code = (0...8).map { ('a'..'z').to_a[rand(26)] }.join
          break code unless Referral.exists?(code: code)
        end
      end
  end
end

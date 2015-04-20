module Devise
  module SessionsControllerExtensions
    def self.prepended(base)
      base.prepend_after_action :create_referral, only: [:create]
    end

    def create_referral
      if try_spree_current_user
        try_spree_current_user.create_referral if try_spree_current_user.referral.nil?
      end
    end
  end
end

Devise::SessionsController.prepend Devise::SessionsControllerExtensions



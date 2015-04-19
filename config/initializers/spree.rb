Spree::PermittedAttributes.user_attributes.push :referral_code, :affiliate_code
config = Rails.application.config
config.after_initialize do
  config.spree.promotions.rules << Spree::Promotion::Rules::ReferredPromotionRule
  config.spree.promotions.rules << Spree::Promotion::Rules::AffiliatedPromotionRule
end

Spree::AppConfiguration.class_eval do
  preference :referral_credits_amount, :decimal
end

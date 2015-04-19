Deface::Override.new(
  :virtual_path => "spree/admin/general_settings/edit",
  :name => "reffiliate_settings",
  :insert_after => "div[id='preferences'] .row"
) do
<<-CODE.chomp
<div class="row">
        <div class="alpha six columns">
          <fieldset class="reffiliate no-border-bottom">
            <legend align="center"><%= Spree.t(:currency_settings)%></legend>
            <div class="field">
              <%= label_tag :referral_credits_amount, Spree.t(:referral_credits_amount) %><br>
              <%= text_field_tag :referral_credits_amount, Spree::Config[:referral_credits_amount], :size => 3 %>
            </div>
          </fieldset>
        </div>
      </div>
    </div>
CODE
end

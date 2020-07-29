Rails.application.config.session_store :cookie_store,
    :expire_after => 2.years,
    :same_site => 'None; Secure'

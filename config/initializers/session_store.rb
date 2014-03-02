# Be sure to restart your server when you modify this file.

SlamStationNation::Application.config.session_store :cookie_store, {
  key: '_slam_station_session',
  expires: 20.years.from_now
}

# =Class nodered::install
class nodered::install inherits nodered {
  require nodered::package

  $nodered::flows.each |$flow| {
    # Install flows
  }
}

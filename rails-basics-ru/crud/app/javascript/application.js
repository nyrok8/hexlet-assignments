// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import Rails from "@rails/ujs"
import "./controllers"
import * as bootstrap from "bootstrap"

Rails.start()

# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "datatables.net-dt" # @2.1.5
pin "datatables.net" # @2.1.5
pin "jquery" # @3.7.1
pin "tailwindcss-tables" # @0.4.0

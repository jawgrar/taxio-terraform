
# Enables Firebase services for the new project created in main.tf.
resource "google_firebase_project" "default" {
  provider = google-beta
  project  = var.project_id #google_project.default.project_id

  # Waits for the required APIs to be enabled.
  depends_on = [
    google_project_service.default
  ]
}

# Creates a Firebase Android App in the new project created above.
resource "google_firebase_android_app" "default" {
  provider = google-beta

  project      = var.project_id #google_project.default.project_id
  display_name = var.android_app_display_name
  package_name = var.android_app_package_name

  # Wait for Firebase to be enabled in the Google Cloud project before creating this App.
  depends_on = [
    google_firebase_project.default,
  ]
}

# TODO: use resource "google_firebase_apple_app" "full" to define app_store_id and team_id
# Creates a Firebase iOS App in the new project created above.
resource "google_firebase_apple_app" "default" {
  provider = google-beta

  project      = var.project_id #google_project.default.project_id
  display_name = var.ios_app_display_name
  bundle_id    = var.ios_app_bundle_id

  # Wait for Firebase to be enabled in the Google Cloud project before creating this App.
  depends_on = [
    google_firebase_project.default,
  ]
}

# Creates a Firebase Web App in the new project created above.
resource "google_firebase_web_app" "default" {
  provider     = google-beta
  project      = var.project_id #google_project.default.project_id
  display_name = var.web_app_display_name

  # The other App types (Android and Apple) use "DELETE" by default.
  # Web apps don't use "DELETE" by default due to backward-compatibility.
  deletion_policy = "DELETE"

  # Wait for Firebase to be enabled in the Google Cloud project before creating this App.
  depends_on = [
    google_firebase_project.default,
  ]
}

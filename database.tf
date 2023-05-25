# Provisions the Firestore database instance.
resource "google_firestore_database" "default" {
  provider = google-beta
  project  = google_project.default.project_id
  name     = "(default)"
  # See available locations: https://firebase.google.com/docs/projects/locations#default-cloud-location
  location_id = var.firebase_region_name
  # "FIRESTORE_NATIVE" is required to use Firestore with Firebase SDKs, authentication, and Firebase Security Rules.
  type             = "FIRESTORE_NATIVE"
  concurrency_mode = "OPTIMISTIC"

  # Wait for Firebase to be enabled in the Google Cloud project before initializing Firestore.
  depends_on = [
    google_project_service.default,
  ]
}

# Creates a ruleset of Firestore Security Rules from a local file.
resource "google_firebaserules_ruleset" "default" {
  provider = google-beta
  project  = google_project.default.project_id
  source {
    files {
      name = "firestore.rules"
      # Write security rules in a local file named "firestore.rules".
      # Learn more: https://firebase.google.com/docs/firestore/security/get-started
      content = file("firestore.rules")
    }
  }

  # Wait for Firestore to be provisioned before creating this ruleset.
  depends_on = [
    google_firestore_database.default,
  ]
}

# Releases the ruleset for the Firestore instance.
resource "google_firebaserules_release" "default" {
  provider     = google-beta
  name         = "cloud.firestore" # must be cloud.firestore
  ruleset_name = google_firebaserules_ruleset.default.name
  project      = google_project.default.project_id

  # Wait for Firestore to be provisioned before releasing the ruleset.
  depends_on = [
    google_firestore_database.default,
  ]
}

# Adds a new Firestore index.
resource "google_firestore_index" "indexes" {
  provider = google-beta
  project  = google_project.default.project_id

  collection  = "users"
  query_scope = "COLLECTION"

  fields {
    field_path = "email"
    order      = "ASCENDING"
  }

  fields {
    field_path = "name"
    order      = "ASCENDING"
  }

  # Wait for Firestore to be provisioned before adding this index.
  depends_on = [
    google_firestore_database.default,
  ]
}

# # Adds a new Firestore document with seed data.
# # Don't use real end-user or production data in this seed document.
# resource "google_firestore_document" "doc" {
#   provider    = google-beta
#   project     = google_project.default.project_id
#   collection  = "users"
#   document_id = "question-1"
#   fields      = "{\"question\":{\"stringValue\":\"Favorite Database\"},\"answer\":{\"stringValue\":\"Firestore\"}}"

#   # Wait for Firestore to be provisioned before adding this document.
#   depends_on = [
#     google_firestore_database.default,
#   ]
# }
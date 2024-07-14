# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Silva.Repo.insert!(%Silva.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Silva.Repo
alias Silva.Medias.Media
alias Silva.School.Subject

Repo.insert! %Media{
  name: "Phoenix LiveView from Scratch",
  description: "One of the best explanations about LiveView",
  content: "GsOcNO0NlHU",
  media_type: :video
}

Repo.insert! %Media{
  name: "Taking Pictures",
  description: "This is a great picture from Flickr",
  content: "https://live.staticflickr.com/65535/50626614036_c68505b270_b.jpg",
  media_type: :picture
}

Repo.insert! %Media{
  name: "Lorem Ipsum example",
  description: "This is a text type demonstration",
  content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
  media_type: :text
}


Repo.insert! %Subject{
  name: "English"
}

Repo.insert! %Subject{
  name: "Mathematics"
}

Repo.insert! %Subject{
  name: "Physics"
}

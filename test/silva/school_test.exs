defmodule Silva.SchoolTest do
  use Silva.DataCase

  alias Silva.School

  describe "subjects" do
    alias Silva.School.Subject

    import Silva.SchoolFixtures

    @invalid_attrs %{name: nil}

    test "list_subjects/0 returns all subjects" do
      subject = subject_fixture()
      assert School.list_subjects() == [subject]
    end

    test "get_subject!/1 returns the subject with given id" do
      subject = subject_fixture()
      assert School.get_subject!(subject.id) == subject
    end

    test "create_subject/1 with valid data creates a subject" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Subject{} = subject} = School.create_subject(valid_attrs)
      assert subject.name == "some name"
    end

    test "create_subject/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = School.create_subject(@invalid_attrs)
    end

    test "update_subject/2 with valid data updates the subject" do
      subject = subject_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Subject{} = subject} = School.update_subject(subject, update_attrs)
      assert subject.name == "some updated name"
    end

    test "update_subject/2 with invalid data returns error changeset" do
      subject = subject_fixture()
      assert {:error, %Ecto.Changeset{}} = School.update_subject(subject, @invalid_attrs)
      assert subject == School.get_subject!(subject.id)
    end

    test "delete_subject/1 deletes the subject" do
      subject = subject_fixture()
      assert {:ok, %Subject{}} = School.delete_subject(subject)
      assert_raise Ecto.NoResultsError, fn -> School.get_subject!(subject.id) end
    end

    test "change_subject/1 returns a subject changeset" do
      subject = subject_fixture()
      assert %Ecto.Changeset{} = School.change_subject(subject)
    end
  end
end

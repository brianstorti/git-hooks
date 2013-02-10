Feature: Commit

  Background:
    Given a directory named "test_repo"
    When I cd to "test_repo"
    And I create a new git repository

  @posix
  Scenario: Denying a commit directly to the master branch
    When I am on the "master" branch
    And I try to commit the file "foo"
    And I answer "y" to the question "Do you really want to commit directly to master? (y/N)"
    Then the commit should not be created

Feature: CLI
  In order to compress all my git repos
  As a cron job writer
  I want the CLI to iterate over my repos

  Scenario: recursively search repos
    Given a checked out repo "repos1/abc"
    And a checked out repo "repos1/def/xyz"
    And a bare repo "repos2/ghi.git"
    And a bare repo "repos3/jkl.git"
    When I run "git-gc-cron scan repos1 repos2"
    Then the repo "repos1/abc" should be packed
    And the repo "repos1/def/xyz" should be packed
    And the repo "repos2/ghi.git" should be packed
    And the repo "repos3/jkl.git" should not be packed

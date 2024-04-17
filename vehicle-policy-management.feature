Feature: Enable/disable policy management of MOD4 vehicles

  #VWCON-22551

  Rule: System considers the empty policy configuration if there is no policy configuration defined in the contract

    Scenario Outline: System considers the default policy configuration if there is no policy configuration defined in the contract
      Given there is a regular organisation with a contract without any policy configuration
      When external system user registers the <first MOD4 vehicle> in its fleet
      Then  the policy configuration is empty for the organisation


      Examples:
        | first MOD4 vehicle  |
        | "WV1M0D4V40MGLJWPG" |

  Rule: System considers the empty policy configuration if only MOD3 vehicle are registered

    Scenario Outline: System considers the default policy configuration if only MOD3 vehicle are registered
      Given there is a regular organisation with a contract which contains policy configuration
      When there are some <MOD3 vehicles> already registered
      Then  the policy configuration is empty for the organisation


      Examples:
        | MOD3 vehicles                           |
        | "WV1MN98GTSGWNPPSS , WV16WUBP4K0B76SDD" |


  Rule: System enables the policy configuration of contract as soon as the first MOD4 vehicle is registered

    Scenario Outline: System enables the policy configuration of contract as soon as the first MOD4 vehicle is registered
      Given there is a regular organisation with a contract which contains policy configuration
      And there are some <MOD3 vehicles> already registered
      #But the policy configuration of the organisation is still empty
      #When external system user registers the <first MOD4 vehicle> in its fleet
      #Then  the policy configuration in the contract is enabled for the organisation

      Examples:
        | MOD3 vehicles                           | first MOD4 vehicle  |
        | "WV1MN98GTSGWNPPJH , WV16WUBP4K0B76SML" | "WV1M0D4V40MGLJEWE" |




  Rule: System enables the default policy configuration as soon as the Last MOD4 vehicle is unregistered
    @targetScenarios
    Scenario Outline: System enables the default policy configuration as soon as the Last MOD4 vehicle is unregistered
      Given there is a regular organisation with a contract which contains policy configuration
      And  there are some <MOD4 vehicles> already registered
      When  external system user unregisters all the MOD4 vehicles in its fleet
      Then  the policy configuration is empty for the organisation

      Examples:
        | MOD4 vehicles       |
        | "WV1M0D4V40MGLJXZS" |



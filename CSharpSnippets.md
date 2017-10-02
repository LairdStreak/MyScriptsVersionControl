##### Programaticaly Edit Config File at run time.

```private void ModifyConnectionToBeBroken()
        {
            var config = ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);
            SalesSystemContextConnectionString = config.ConnectionStrings.ConnectionStrings[connStrName].ConnectionString;
            SalesSystemContextConnectionStringProvider = config.ConnectionStrings
                .ConnectionStrings[connStrName]
                .ProviderName;

            var replaceCS = new ConnectionStringSettings
            {
                Name = connStrName,
                ConnectionString = "",
                ProviderName = ""
            };

            config.ConnectionStrings.ConnectionStrings.Remove(connStrName);
            config.ConnectionStrings.ConnectionStrings.Add(replaceCS);
            config.Save(ConfigurationSaveMode.Modified);
            ConfigurationManager.RefreshSection("connectionStrings");
        }

        private void ModifyConnectionFixed()
        {
            var config = ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);
            
            var replaceCS = new ConnectionStringSettings
            {
                Name = connStrName,
                ConnectionString = SalesSystemContextConnectionString,
                ProviderName = SalesSystemContextConnectionStringProvider
            };

            config.ConnectionStrings.ConnectionStrings.Remove(connStrName);
            config.ConnectionStrings.ConnectionStrings.Add(replaceCS);
            config.Save(ConfigurationSaveMode.Modified);
            ConfigurationManager.RefreshSection("connectionStrings");
        }
```

##### Dynamics crm optionset tests.
```c#
// FormattedValues cannot be set I want to later re-use this code there must be a way to test this method!!!!!
        //[Test]
        //public void Test_GetOptionSetDisplayString_Method()
        //{
        //    PicklistAttributeMetadata retrievedPicklistAttributeMetadata = new PicklistAttributeMetadata();
        //    OptionMetadata femaleOption = new OptionMetadata(new Label("Female", LangCodeUsEnglish), 43); //as with all our mocks, the actual values don't matter so long as they're consistent throughout the test  
        //    femaleOption.Label.UserLocalizedLabel = new LocalizedLabel("Female", LangCodeUsEnglish);
        //    femaleOption.Label.UserLocalizedLabel.Label = "Female";
        //    var myOptionSet = new OptionSetMetadata
        //    {
        //       Name = "gendercode",
        //       DisplayName = new Label("Gender", LangCodeUsEnglish),
        //       IsGlobal = true,OptionSetType = OptionSetType.Picklist,
        //       Options = { femaleOption }
        //    };
        //    retrievedPicklistAttributeMetadata.OptionSet = myOptionSet;
        //    var testEntity = new Entity("account");
        //    testEntity.Attributes.Add("Gender",myOptionSet);
        //    testEntity.FormattedValues
        //    var reader = new DynamicsCrmEntityFieldReader();
        //    var result = reader.GetOptionSetDisplayString(testEntity, "Gender");

        //    Assert.Pass();
        //}
```

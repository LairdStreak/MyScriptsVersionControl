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
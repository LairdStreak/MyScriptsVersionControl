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

##### Dynamics HermesTestSender.
```c#
//using System;
//using System.IO;
//using System.Net;
//using System.Text;
//using DynamicsPlugin.Models;
//using Newtonsoft.Json;
//
//namespace ReportsScratchPad
//{
//    public class HermesTestSender
//    {
//        private const string UrIendPointBase = "";
//        private const string Username = @"";
//        private const string Password = @"";
//
//        // ReSharper disable once MemberCanBeMadeStatic.Global NO MORE STATIC PLEASE RESHARPER YOU GETTING US INTO TROUBLE!!!!
//        public bool SendTestMessageClient()
//        {
//            var model = new HermesCrmAccountSendRecord()
//            {
//                externalid = Guid.NewGuid().ToString(),
//                companyname = "Test",
//                customer_sector = "South America - Chile Peru"
//            };
//            var jsonData = JsonConvert.SerializeObject(model);
//            var partialUri = new Uri(Guid.NewGuid().ToString(), UriKind.Relative);
//            var fullUri = new Uri(new Uri(UrIendPointBase),partialUri);
//            var credentials = Convert.ToBase64String(Encoding.ASCII.GetBytes(Username + ":" + Password));
//            try
//            {
//                using (var client = new WebClient())
//                {
//                    client.Headers[HttpRequestHeader.Authorization] = $"Basic {credentials}";
//                    client.Headers[HttpRequestHeader.ContentType] = "application/json";
//                    client.Headers[HttpRequestHeader.Accept] = "application/json";
//                    var reply = client.UploadString(fullUri, "PUT", jsonData);
//                    Console.WriteLine(reply);
//                }
//            }
//            catch (WebException wex)
//            {
//                if (wex.Response == null) return false;
//                using (var errorResponse = (HttpWebResponse)wex.Response)
//                {
//                    using (var reader = new StreamReader(errorResponse.GetResponseStream()))
//                    {
//                        var error = reader.ReadToEnd();
//                        Console.WriteLine(error);
//                    }
//                }
//                return false;
//            }
//            catch (Exception e)
//            {
//                Console.WriteLine(e);
//                throw;
//            }
//            
//
//            return true;
//        }
//    }
//}
```
#### C# Dynamics CRM Proxy
```C#
//using System;
//using System.ServiceModel;
//using System.ServiceModel.Description;
//
//// These namespaces are found in the Microsoft.Xrm.Sdk.dll assembly
//// found in the SDK\bin folder.
//using Microsoft.Xrm.Sdk;
//using Microsoft.Xrm.Sdk.Client;
//using Microsoft.Xrm.Sdk.Query;
//using Microsoft.Xrm.Sdk.Discovery;
//
//namespace Microsoft.Crm.Sdk.Samples
//{
//    /// <summary>
//    /// Demonstrates how to do basic entity operations like create, retrieve,
//    /// update, and delete.
//    /// If you want to run this sample repeatedly, you have the option to 
//    /// delete all the records created at the end of execution.
//    /// </summary>
//    public class CRUDOperationsDE
//    {
//        #region Class Level Members
//        /// <summary>
//        /// Stores the organization service proxy.
//        /// </summary>
//        private OrganizationServiceProxy _serviceProxy;
//        private IOrganizationService _service;
//
//        // Define the IDs needed for this sample.
//        private Guid _accountId;
//
//        #endregion Class Level Members
//
//        #region How To Sample Code
//        /// <summary>
//        /// Create and configure the organization service proxy.
//        /// Create an account record
//        /// Retrieve the account record
//        /// Update the account record
//        /// Optionally delete any entity records that were created for this sample.
//       /// </summary>
//        /// <param name="serverConfig">Contains server connection information.</param>
//        /// <param name="promptForDelete">When True, the user will be prompted to delete
//        /// all created entities.</param>
//        public void Run(ServerConnection.Configuration serverConfig, bool promptForDelete)
//        {
//            try
//            {
//
//                // Connect to the Organization service. 
//                // The using statement assures that the service proxy will be properly disposed.
//                using (_serviceProxy = new OrganizationServiceProxy(serverConfig.OrganizationUri, serverConfig.HomeRealmUri,serverConfig.Credentials, serverConfig.DeviceCredentials))
//                {
//                    _service = (IOrganizationService)_serviceProxy;
//
//                    // Instaniate an account object.
//                    Entity account = new Entity("account");
//
//                    // Set the required attributes. For account, only the name is required. 
//                    // See the Entity Metadata topic in the SDK documentatio to determine 
//                    // which attributes must be set for each entity.
//                    account["name"] = "Fourth Coffee";
//
//                    // Create an account record named Fourth Coffee.
//                    _accountId = _service.Create(account);
//
//                    Console.Write("{0} {1} created, ", account.LogicalName, account.Attributes["name"]);
//
//                    // Create a column set to define which attributes should be retrieved.
//                    ColumnSet attributes = new ColumnSet(new string[] { "name", "ownerid" });
//
//                    // Retrieve the account and its name and ownerid attributes.
//                    account = _service.Retrieve(account.LogicalName, _accountId, attributes);
//                    Console.Write("retrieved, ");
//
//                    // Update the postal code attribute.
//                    account["address1_postalcode"] = "98052";
//
//                    // The address 2 postal code was set accidentally, so set it to null.
//                    account["address2_postalcode"] = null;
//
//                    // Shows use of Money.
//                    account["revenue"] = new Money(5000000);
//
//                    // Shows use of boolean.
//                    account["creditonhold"] = false;
//
//                    // Update the account.
//                    _service.Update(account);
//                    Console.WriteLine("and updated.");
//
//                    // Delete the account.
//                    bool deleteRecords = true;
//
//                    if (promptForDelete)
//                    {
//                        Console.WriteLine("\nDo you want these entity records deleted? (y/n) [y]: ");
//                        String answer = Console.ReadLine();
//
//                        deleteRecords = (answer.StartsWith("y") || answer.StartsWith("Y") || answer == String.Empty);
//                    }
//
//                    if (deleteRecords)
//                    {
//                        _service.Delete("account", _accountId);
//
//                        Console.WriteLine("Entity record(s) have been deleted.");
//                    }
//
//                }
//            }
//
//            // Catch any service fault exceptions that Microsoft Dynamics CRM throws.
//            catch (FaultException<Microsoft.Xrm.Sdk.OrganizationServiceFault>)
//            {
//                // You can handle an exception here or pass it back to the calling method.
//                throw;
//            }
//        }
//
//        #endregion How To Sample Code
//
//        #region Main
//        /// <summary>
//        /// Standard Main() method used by most SDK samples.
//        /// </summary>
//        /// <param name="args"></param>
//        static public void Main(string[] args)
//        {
//            try
//            {
//                // Obtain the target organization's Web address and client logon 
//                // credentials from the user.
//                ServerConnection serverConnect = new ServerConnection();
//                ServerConnection.Configuration config = serverConnect.GetServerConfiguration();
//
//                CRUDOperationsDE app = new CRUDOperationsDE();
//                app.Run(config, true);
//            }
//            catch (FaultException<Microsoft.Xrm.Sdk.OrganizationServiceFault> ex)
//            {
//                Console.WriteLine("The application terminated with an error.");
//                Console.WriteLine("Timestamp: {0}", ex.Detail.Timestamp);
//                Console.WriteLine("Code: {0}", ex.Detail.ErrorCode);
//                Console.WriteLine("Message: {0}", ex.Detail.Message);
//                Console.WriteLine("Plugin Trace: {0}", ex.Detail.TraceText);
//                Console.WriteLine("Inner Fault: {0}",
//                    null == ex.Detail.InnerFault ? "No Inner Fault" : "Has Inner Fault");
//            }
//            catch (System.TimeoutException ex)
//            {
//                Console.WriteLine("The application terminated with an error.");
//                Console.WriteLine("Message: {0}", ex.Message);
//                Console.WriteLine("Stack Trace: {0}", ex.StackTrace);
//                Console.WriteLine("Inner Fault: {0}",
//                    null == ex.InnerException.Message ? "No Inner Fault" : ex.InnerException.Message);
//            }
//            catch (System.Exception ex)
//            {
//                Console.WriteLine("The application terminated with an error.");
//                Console.WriteLine(ex.Message);
//
//                // Display the details of the inner exception.
//                if (ex.InnerException != null)
//                {
//                    Console.WriteLine(ex.InnerException.Message);
//
//                    FaultException<Microsoft.Xrm.Sdk.OrganizationServiceFault> fe = ex.InnerException
//                        as FaultException<Microsoft.Xrm.Sdk.OrganizationServiceFault>;
//                    if (fe != null)
//                    {
//                        Console.WriteLine("Timestamp: {0}", fe.Detail.Timestamp);
//                        Console.WriteLine("Code: {0}", fe.Detail.ErrorCode);
//                        Console.WriteLine("Message: {0}", fe.Detail.Message);
//                        Console.WriteLine("Plugin Trace: {0}", fe.Detail.TraceText);
//                        Console.WriteLine("Inner Fault: {0}",
//                            null == fe.Detail.InnerFault ? "No Inner Fault" : "Has Inner Fault");
//                    }
//                }
//            }
//            // Additional exceptions to catch: SecurityTokenValidationException, ExpiredSecurityTokenException,
//            // SecurityAccessDeniedException, MessageSecurityException, and SecurityNegotiationException.
//
//            finally
//            {
//
//                Console.WriteLine("Press <Enter> to exit.");
//                Console.ReadLine();
//            }
//
//        }
//        #endregion Main
//    }
//}
```
**_What is AWS Lambda_** : AWS lambda is a secure, event-driven, serverless compute service that scales as needed and bulled only for what is used

**_Serverless_** : Serverless doesn't mean there are no servers. you don't manage the servers or any physical infrastructure. Aws manages every things for you

**_Event-driven_** : - Pushed based architecture instead of continuous pooling

- Create Own Lambda Function
- Cloud compute service without the need of managing a server
- You only own the code or provide container image
- Write the code in your preferred language
- Ideal for short, event driven workloads
- pay only for the duration of usage of compute resources
- CPU power allocation proportional to the amount of memory provisioned

### Terminology

- **_Function_**: An instance of your in lambda environment.
- **_Trigger_** : A resource of configuration that triggers or invokes your lambda function.
- **_Event_** : A document is JSON format containing data for your function to process, emitted by a trigger or an event source.
- **_Execution Environment_** : A secure and isolated runtime Environment for your Lambda function, that manages all the process and resources required to tun the function
- **_Runtime_**: It provides a language-specific environment that runs in an execution environment. In case of a container image, the runtime is included in the build.
- **_Deployment package_**: Your Lambda function code is deployed using a deployment package which can either be .Zip file archive or a container image
- **_Layer_**: A.zip file archive that can contain additional code or other content like libraries, a custom runtime, data or configuration files. it can be shared among many functions
- **_concurrency_**: The number of your function instances available to process the request.
- **_Qualifier_**: Used to specify a version or alias of your function. A version is an immutable snapshot of your function while an Alias is a pointer to a specific version of a function
- **_Destination_**: An AWS resource that receives event from lambda generally from an asynchronous invocation.

### An Event

```
{
    "key1":"Value1",
    "key2":{
        "children":"Value2"
    },
    "key3":{
        "children":"Value3"
    }
}
```

### Creating a Lambda Function

- A deployment package denoted your compiled source code along with all other dependencies Lambda supports two types of deployment packages:
- Write your code in Lambda console editor for non-compiled language.

- In case of your compiled languages, upload your code in the form of a ZIP archive deployment package.

- You create a Docker image of your application and store it into Amazon ECR repository. Create your function defined as a container image

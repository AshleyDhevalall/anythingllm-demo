# anythingllm-demo
The objective of this article is to run large language models locally to analyze local docs. In this use case we analyze Shakespeare's Romeo And Juliet and Twelfth Night plays in pdf form.

## What is AnythingLLM?

It is an all-in-one zero-setup private application for local LLMs, RAG and AI Agents with embedding models and vector database supportability

## Steps to follow

1. Download [AnythingLLM](https://anythingllm.com/download)
> [!TIP]
> [QuickStart](https://docs.anythingllm.com/installation-desktop/overview)  

2. Open AnythingLLM. Please patient while the application opens...  
![anythingllm](https://github.com/AshleyDhevalall/anythingllm-demo/blob/main/docs/anythingllm.png)

3. Create new workspace. Enter name for collection and click `Save`
> [!TIP]
> [Workspaces](https://docs.anythingllm.com/chat-ui)
<img src="https://github.com/AshleyDhevalall/anythingllm-demo/blob/main/docs/new_workspace.png" style='height: 30%; width: 30%;'>

4. Clone repository
```
git clone https://github.com/AshleyDhevalall/gpt4all-demo.git
```

5. Upload files. Navigate to the folder you cloned in Step 4 
> [!WARNING]  
> PDF, TXT, DOCX, Word docs and more. Unfortunately the tool does not support .ps1 file :(

Please patient while the files complete embedding...

<img src="https://github.com/AshleyDhevalall/anythingllm-demo/blob/main/docs/download.png" style='height: 50%; width: 50%;'>

6. Enter your prompt and click `Send`
```
Who are the characters in romeo-and-juliet_PDF_FolgerShakespeare.pdf?
```
Sample chat response  
![chat](https://github.com/AshleyDhevalall/anythingllm-demo/blob/main/docs/prompt.png)

> [!IMPORTANT]  
> Always verify the accuracy of the results  

## Troubleshooting
#### Embedding taking too long
Uploading large files will result in an increased duration for the embedding to complete. Alternatively try a smaller subset of docs

#### Load Docs collection shows 0 files and 0 words

<img src="https://github.com/AshleyDhevalall/gpt4all-demo/blob/main/docs/troubleshooting.png" style='height: 70%; width: 70%;'>

Ensure that you have included the correct file extension
![allowed_file_extensions](https://github.com/AshleyDhevalall/gpt4all-demo/blob/main/docs/allowed_file_extensions.png)



#### Chat window closes after selecting model -> try using a smaller model
This usually happens when using models that required more RAM than is available on your system. Try using a smaller model

<img src="https://github.com/AshleyDhevalall/gpt4all-demo/blob/main/docs/ram_required.png" style='height: 70%; width: 70%;'>

## Further reading  
[Quickstart](https://docs.gpt4all.io/gpt4all_desktop/quickstart.html#quickstart)  
[System Requirements]()
[FAQ](https://docs.anythingllm.com/llm-not-using-my-docs)  
[Configuration](https://docs.anythingllm.com/configuration)  

## Authors

[Ashley Dhevalall](https://github.com/AshleyDhevalall)

## Acknowledgements

[GTP4All](<https://www.nomic.ai/gpt4all>)
[anakin.ai](<https://anakin.ai/blog/anything-llm/>)


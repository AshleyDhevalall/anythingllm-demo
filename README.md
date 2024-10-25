# AnythingLLM Demo
The objective of this article is to run large language models locally to analyze local docs. In this use case we analyze Shakespeare's Romeo And Juliet.

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
git clone https://github.com/AshleyDhevalall/anythingllm-demo.git
```

5. Upload files. Navigate to the folder you cloned in Step 4 
> [!WARNING]  
> PDF, TXT, DOCX, Word docs and more. Unfortunately the tool does not support .ps1 file :(

<img src="https://github.com/AshleyDhevalall/anythingllm-demo/blob/main/docs/upload.png" style='height: 60%; width: 60%;'>

Ensure that you move the documents to the Workspaces. Click `Save and Embed`

<img src="https://github.com/AshleyDhevalall/anythingllm-demo/blob/main/docs/embedding.png" style='height: 65%; width: 65%;'>

Please patient while the files complete embedding...

Close the `My Documents window` once the embedding is complete

<img src="https://github.com/AshleyDhevalall/anythingllm-demo/blob/main/docs/download.png" style='height: 50%; width: 50%;'>

6. Enter your prompt and click `Send prompt message to workspace` icon
```
Who are the characters in romeo-and-juliet_PDF_FolgerShakespeare.pdf?
```
Sample prompt request  
<img src="https://github.com/AshleyDhevalall/anythingllm-demo/blob/main/docs/prompt.png" style='height: 60%; width: 60%;'>

Sample prompt response  
![chat](https://github.com/AshleyDhevalall/anythingllm-demo/blob/main/docs/chat_response.png)

> [!IMPORTANT]  
> Always verify the accuracy of the results  

## Troubleshooting
Could not respond to message. fetch failed
> [!TIP]
> [Fetch failed error on embed](https://docs.anythingllm.com/fetch-failed-on-upload)

![troubleshooting](https://github.com/AshleyDhevalall/anythingllm-demo/blob/main/docs/trouble-shooting.png)

## Further reading 
[Setup](https://docs.anythingllm.com/setup/llm-configuration/local/built-in)  
[Configuration](https://docs.anythingllm.com/configuration)  
[System Requirements](https://docs.anythingllm.com/installation-desktop/system-requirements)  
[FAQ](https://docs.anythingllm.com/llm-not-using-my-docs)  

## Authors

[Ashley Dhevalall](https://github.com/AshleyDhevalall)

## Acknowledgements

[AnythingLLM](<https://anythingllm.com/>)  
[anakin.ai](<https://anakin.ai/blog/anything-llm/>)  

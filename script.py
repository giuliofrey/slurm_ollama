from ollama import chat
from ollama import ChatResponse

response: ChatResponse = chat(model='llama3.1:8b', messages=[
	  {
	    'role': 'user',
	    'content': 'What is endogeneity',
	  },
	])
print(response['message']['content'])

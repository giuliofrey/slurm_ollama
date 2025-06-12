import ollama

def test_ollama():
    # Test if the ollama package can be imported and used
    try:
        model = ollama.Model("llama2")
        response = model.generate("What is endogeneity?")
        assert isinstance(response, str)
    except Exception as e:
        assert False, f"Test failed with exception: {e}"
        
if __name__ == "__main__":
    test_ollama()
    print("Ollama python test passed successfully.")
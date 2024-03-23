using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class IsPuzzleSolved : MonoBehaviour
{
	public Color successColor = Color.blue;
	public GameObject successIndicator;
    // Start is called befsuccessIndicatorore the first frame update
    void Start()
    {
		successIndicator.GetComponent<Renderer>().material.color = Color.red;
    }
    
    // Update is called once per frame
    void Update()
    {
		if (successIndicator.GetComponent<Renderer>().material.color != Color.white)
        {
			foreach (Transform child in transform)
            {
                Renderer renderer = child.GetComponent<Renderer>();
                Material material = renderer.material;
                Color color = material.color;
                if (color != successColor) 
                {
                    return;
                }
            }
            successIndicator.GetComponent<Renderer>().material.color = Color.white;
		}
    }
}

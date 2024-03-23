using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class PressEventController : MonoBehaviour
{
    public Camera mainCamera;
    public float distance = 10f;
    public Color defaultColor = Color.red; 
    public Color actionColor = Color.blue;
    private GameObject otherObject;
	public GameObject text;
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        otherObject = GameObject.Find("PuzzleResult");
		RaycastHit hit;
        Ray ray = mainCamera.ScreenPointToRay(new Vector3(Screen.width / 2, Screen.height / 2, 0));
        if (Physics.Raycast(ray, out hit, distance) && hit.collider.gameObject == gameObject && otherObject.GetComponent<Renderer>().material.color != Color.white && Input.GetButtonDown("Action"))
        {
            string input = gameObject.name;
            string[] parts = input.Split('-');
            int puzzleY = int.Parse(parts[0]);
            int puzzleX = int.Parse(parts[1]);
            colorChange(puzzleY, puzzleX);
            switch (puzzleY)
            {
                case 1:
                    colorChange(puzzleY+1, puzzleX);
                    break;
                case 5:
                    colorChange(puzzleY-1, puzzleX);
                    break;
                default:
                    colorChange(puzzleY+1, puzzleX);
                    colorChange(puzzleY-1, puzzleX);
                    break;
            }
            switch (puzzleX)
            {
                case 1:
                    colorChange(puzzleY, puzzleX+1);
                    break;
                case 5:
                    colorChange(puzzleY, puzzleX-1);
                    break;
                default:
                    colorChange(puzzleY, puzzleX+1);
                    colorChange(puzzleY, puzzleX-1);
                    break;
            }
		}
    }

    void colorChange(int puzzleY, int puzzleX)
    {
        string result = puzzleY.ToString() + "-" + puzzleX.ToString();
        otherObject = GameObject.Find(result);
       if (otherObject.GetComponent<Renderer>().material.color == defaultColor)
        {
            otherObject.GetComponent<Renderer>().material.color = actionColor;
        }
        else
        {
            otherObject.GetComponent<Renderer>().material.color = defaultColor;
        } 
    }
}

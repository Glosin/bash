using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Door : MonoBehaviour
{
    public GameObject text;
    public float distance = 2f;
    public string openAnimationName = "open";
    public string closeAnimationName = "close";
    private Animator animator;
    private GameObject otherObject;
    
    void Update()
    {
        RaycastHit hit;
        Ray ray = new Ray(transform.position, transform.forward);
        otherObject = GameObject.Find("PuzzleResult");
        if (Physics.Raycast(ray, out hit, distance) && hit.collider.gameObject.tag == "door" && otherObject.GetComponent<Renderer>().material.color == Color.white)
        {
            Animator animator = hit.collider.transform.root.gameObject.GetComponent<Animator>();
            animator.ResetTrigger("close");
            text.SetActive(true);
            if (Input.GetButtonDown("Action"))
            {
                if (animator.GetCurrentAnimatorStateInfo(0).IsName(openAnimationName))
                {
                    animator.ResetTrigger("open");
                    animator.SetTrigger("close");
                } 
                else if (animator.GetCurrentAnimatorStateInfo(0).IsName(openAnimationName))
                {
                    animator.ResetTrigger("close");
                    animator.SetTrigger("open");
                }
                else
                {
                    animator.ResetTrigger("close");
                    animator.SetTrigger("open");
                }
            }
        }
        else
        {
            text.SetActive(false);
        }
    }
}

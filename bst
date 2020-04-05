//insert;search;height;print inorder,preorder,postorder
#include<bits/stdc++.h>
#include<iostream>
#include<stdlib.h>
using namespace std;
struct node{
	int data;
	node *left,*right;
};
node* root=NULL;
node* insertnode(node* root,int d)
{
	node* temp=new node;
	temp->data=d;
	temp->left=NULL;
	temp->right=NULL;
	if(root==NULL)
		root=temp;
	else if(root->data<d)
		root->right=insertnode(root->right,d);
	else
		root->left=insertnode(root->left,d);
	return root;
}
void searchnode(node* root,int d)
{
	if(root->data==d)
		cout<<"Element found"<<endl;
	else if(root==NULL)
		cout<<"Element not found"<<endl;
	else if(root->data<d)
		searchnode(root->right,d);
	else
		searchnode(root->left,d);
	return;
}
int height(node* root)
{
	if(root==NULL)
		return -1;
	if((root->left==NULL)&&(root->right==NULL))
		return 0;
	int lh=height(root->left);
	int rh=height(root->right);
	return (max(lh,rh)+1);
}
void inorder(node* root)
{
	if(root==NULL)
		return;
	inorder(root->left);
	cout<<root->data<<" ";
	inorder(root->right);
}
void preorder(node* root)
{
	if(root==NULL)
		return;
	cout<<root->data<<" ";
	preorder(root->left);
	preorder(root->right);
}
void postorder(node* root)
{
	if(root==NULL)
		return;
	postorder(root->left);
	postorder(root->right);
	cout<<root->data<<" ";
}
int main()
{
	int n,a;
	cout<<"No of elements initially: ";
	cin>>n;
	cout<<"Enter the elements: ";
	for(int i=0;i<n;i++)
	{
		cin>>a;
		root=insertnode(root,a);
	}
	cout<<"Element to be searched: ";
	cin>>a;
	searchnode(root,a);
	cout<<"inorder: ";
	inorder(root);
	cout<<"preorder: ";
	preorder(root);
	cout<<"postorder: ";
	postorder(root);
	int h=height(root);
	cout<<"height: "<<h<<endl;
	return 0;
}

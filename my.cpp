//
// Created by chenshao on 2023/5/16.
//

#include <vector>
enum valueType
{
    TINT,TSTRING,TLIST
};

struct Jitem
{
    string name;
    valueType type;
    virtual  void * get()=0;
    virtual  show()=0;
};

using itemList=vector<item>;
struct intItem: public Jitem
{
    int value;
    void * get() override {
        return &value;
    }
    void show()override
    {
        cout<<name<<":";

        cout<<value;
    }
};
struct stringItem: public Jitem
{
    string value;
    void * get() override {
        return &value;
    }
    void show()override
    {
        cout<<name<<":";

        cout<<value;
    }
};
struct listItem: public Jitem
{
    vector<int> value;
    void * get() override {

        return &value;
    }
    void show()override
    {
        cout<<name<<":";
        for(int i:velue)cout<<i<<' ';
    }
};

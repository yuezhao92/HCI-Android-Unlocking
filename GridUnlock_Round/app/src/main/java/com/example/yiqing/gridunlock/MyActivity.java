package com.example.yiqing.gridunlock;

import android.content.Intent;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.Button;
import android.widget.TextView;
import android.content.Intent;

public class MyActivity extends AppCompatActivity {
    public static int count = 0;
    public final static String[] answer = {"1234","2234","3234","4234","5234","1111","2222","3333","4444","5555"};
    public final static String EXTRA_MESSAGE = "com.mycompany.myfirstapp.MESSAGE";
    public StringBuffer rec = new StringBuffer("");
    public StringBuffer acc = new StringBuffer("");
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.activity_my);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        FloatingActionButton fab = (FloatingActionButton) findViewById(R.id.fab);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Snackbar.make(view, "Replace with your own action", Snackbar.LENGTH_LONG)
                        .setAction("Action", null).show();
            }
        });
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_my, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }

    //Called when clicking Send button
    public void sendMessage(View view){
        Button b = (Button)view;
        String buttonText = b.getText().toString();
        System.out.println("the number pressed this time is:"+buttonText);
        rec.append(buttonText);
        acc.append(buttonText);
        if(rec.length()==4){
            if(rec.toString().equals(answer[count])) {
                System.out.println("correct");
                acc.append(" correct ");
                rec.setLength(0);
                count++;
                TextView tmp = (TextView) findViewById(R.id.display);
                System.out.println(tmp);
                tmp.setText(count+"");
            }
            else{
                System.out.println("incorrect");
                acc.append(" incorrect ");
                count++;
                rec.setLength(0);
                TextView tmp = (TextView) findViewById(R.id.display);
                System.out.println(tmp);
                tmp.setText(count + "");
            }
            if(count==answer.length){
                System.out.println("^^^^^^^^^^^^^6");
                Intent intent = new Intent(this, DisplayMessageActivity.class);
                System.out.println("^^^^^^^^^^^^^6");
                intent.putExtra(EXTRA_MESSAGE, acc.toString());
                System.out.println("^^^^^^^^^^^^^6");
                startActivity(intent);
            }

        }
    }

}

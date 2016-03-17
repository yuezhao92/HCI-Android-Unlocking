package com.example.weiweili.gridunlock;

import android.content.Intent;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import java.util.Random;

public class MyActivity extends AppCompatActivity {
    public static int count = 0;
    public static int K = 9;  // test K answers
    public final static String[] answer = generateAnswerString(K);
    public final static String EXTRA_MESSAGE = "com.mycompany.myfirstapp.MESSAGE";
    public StringBuffer rec = new StringBuffer("");
    public StringBuffer acc = new StringBuffer("");
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        prinf(answer);
//        System.out.println("wo print de shi : "+ answer[0]);
//        TextView tv = (TextView) findViewById(R.id.number);
//        tv.setText(answer[0]);
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

    public static void prinf(String[] str){
        for(String str1 : str){
         System.out.print(str1+" ");
        }
        System.out.println();
    }

    public static int generateNum() {
        Random rand = new Random();
        return rand.nextInt(9999 - 1000) + 1000;
    }


    public static String[] generateAnswerString(int K) {
        String[] result = new String[K];
        for (int i = 0; i < K; i++) {
            int number = generateNum();
            result[i] = String.valueOf(number);
        }
        return result;
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
            if(count==0){
                if (rec.toString().equals("4231")){
                    System.out.println("correct");
                    acc.append(" correct ");
                    rec.setLength(0);
                    count++;
                    TextView tmp = (TextView) findViewById(R.id.display);
                    tmp.setText(count + "");
                    TextView tv = (TextView) findViewById(R.id.number);
                    tv.setText(answer[count - 1]);
                }
                else{
                    System.out.println("incorrect");
                    acc.append(" incorrect ");
                    count++;
                    rec.setLength(0);
                    TextView tmp = (TextView) findViewById(R.id.display);
                    tmp.setText(count + "");
                    TextView tv = (TextView) findViewById(R.id.number);
                    tv.setText(answer[count - 1]);
                }
            }
            else {
                if (rec.toString().equals(answer[count-1])) {
                    System.out.println("correct");
                    acc.append(" correct ");
                    rec.setLength(0);
                    count++;
                    TextView tmp = (TextView) findViewById(R.id.display);
                    System.out.println(tmp);
                    tmp.setText(count + "");
                    TextView tv = (TextView) findViewById(R.id.number);
                    System.out.println("this is time:" + (count - 1) + " and the number should be :" + answer[count - 1]);
                    tv.setText(answer[count - 1]);
                } else {
                    System.out.println("incorrect");
                    acc.append(" incorrect ");
                    count++;
                    rec.setLength(0);
                    TextView tmp = (TextView) findViewById(R.id.display);
                    System.out.println(tmp);
                    tmp.setText(count + "");
                    TextView tv = (TextView) findViewById(R.id.number);
                    tv.setText(answer[count - 1]);
                }
            }
            if(count==9){
                Intent intent = new Intent(this, DisplayMessageActivity.class);
                intent.putExtra(EXTRA_MESSAGE, acc.toString());
                startActivity(intent);
            }

        }
    }

}

package com.example.stayawake;

import android.app.Activity;
import android.app.admin.DevicePolicyManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.Parcelable;
import android.preference.Preference;
import android.preference.PreferenceFragment;
import android.util.Log;
import android.preference.CheckBoxPreference;
import android.preference.PreferenceFragment;
import android.app.AlertDialog;
import com.teliapp.powervolume.R;


public class Settings extends Activity 
{
	//=================================================================================================
	//=================================================================================================
	static private class EnableClick implements Preference.OnPreferenceClickListener 
    {
        private Context mContext;

        public EnableClick(Context context) 
        {
            super();
            this.mContext = context;
        }

        public boolean onPreferenceClick(Preference preference) 
        {
            SharedPreferences sp = this.mContext.getSharedPreferences(Settings.SettingsFragment.PREFS, android.content.Context.MODE_PRIVATE);
            boolean pref_enable = sp.getBoolean("pref_enable", false);
            Log.e(null, "here " + pref_enable);
            Intent intentService = new Intent(this.mContext, SoundService.class);
            if (!pref_enable) //本来是不允许，现在就应该允许了
            {
            	preference.setSummary(R.string.pref_enable_sum);
            	preference.setIcon(R.drawable.on);
                intentService.putExtra(SoundService.ACTION, SoundService.ACTION_CREATE);
            }
            else 
            {
            	preference.setSummary(R.string.pref_disable_sum);
            	preference.setIcon(R.drawable.off);
                intentService.putExtra(SoundService.ACTION, SoundService.ACTION_KILL);
            }
            SharedPreferences.Editor editor = sp.edit();
            editor.putBoolean("pref_enable", !pref_enable);
            editor.commit();
            this.mContext.startService(intentService);
            return true;
        }
    }
	//=================================================================================================
	//=================================================================================================
    static public class SettingsFragment extends PreferenceFragment 
    {
        class CheckClick implements SharedPreferences.OnSharedPreferenceChangeListener 
        {
            private Activity mContext;

            public CheckClick(Activity context) 
            {
                this.mContext = context;
            }

            public void onSharedPreferenceChanged(SharedPreferences prefs, String key) 
            {
                boolean isEnabled = prefs.getBoolean(key, false);
                if (!"pref_screen".equals(key)) 
                {
                    if (!"screen_enable".equals(key)) 
                    {
                        return;
                    }
                    if (isEnabled) 
                    {
                        return;
                    }
                    ((CheckBoxPreference)SettingsFragment.this.findPreference("pref_screen")).setChecked(false);
                }
                else if (isEnabled) 
                {
                    if (!prefs.getBoolean("screen_enable", false)) 
                    {
                        SettingsFragment.checkPrivileges(this.mContext);
                    }
                    this.showDialog(R.string.dialog_mesg);
                }
                else 
                {
                    this.showDialog(R.string.dialog_warning_mesg);
                }
            }

            private void showDialog(int id) 
            {
                AlertDialog.Builder builder = new AlertDialog.Builder(this.mContext);
                builder.setMessage(id);
                builder.setPositiveButton(R.string.ok, new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int which) 
                    {
                        dialog.dismiss();
                    }
                });
                builder.create().show();
            }
        }

        public static final String PREFS = "com.teliapp.PREFS";
        
        private SharedPreferences.OnSharedPreferenceChangeListener mCheckListener;

        public SettingsFragment() 
        {
            super();
        }

        private static void checkPrivileges(Activity context) 
        {
        	DevicePolicyManager pm = (DevicePolicyManager)context.getSystemService(Context.DEVICE_POLICY_SERVICE);
            ComponentName cn = new ComponentName(((Context)context), DarPolicy.class);
            if (!pm.isAdminActive(cn)) 
            {
                Intent intent = new Intent(DevicePolicyManager.ACTION_ADD_DEVICE_ADMIN);
                intent.putExtra(DevicePolicyManager.EXTRA_DEVICE_ADMIN, ((Parcelable)cn));
                intent.putExtra(DevicePolicyManager.EXTRA_ADD_EXPLANATION, "This app needs your permission to turn off your screen");
                context.startActivityForResult(intent, Settings.GET_ADMIN_PERMISSION);
            }
        }

        public void onCreate(Bundle savedInstanceState) 
        {
            super.onCreate(savedInstanceState);
            this.getPreferenceManager().setSharedPreferencesName(Settings.SettingsFragment.PREFS);
            this.addPreferencesFromResource(R.layout.pref_fragment);
            this.mCheckListener = new CheckClick(this.getActivity());
            this.prepare();
        }

        public void onPause() 
        {
            super.onPause();
            this.getPreferenceScreen().getSharedPreferences().unregisterOnSharedPreferenceChangeListener(this.mCheckListener);
        }

        public void onResume() 
        {
            super.onResume();
            this.getPreferenceScreen().getSharedPreferences().registerOnSharedPreferenceChangeListener(this.mCheckListener);
        }

        private void prepare() 
        {
            Preference preference = this.findPreference("pref_enable");
            if (this.getPreferenceScreen().getSharedPreferences().getBoolean("pref_enable", false)) 
            {
            	preference.setSummary(R.string.pref_enable_sum);
            	preference.setIcon(R.drawable.on);
                Intent intentService = new Intent(this.getActivity(), SoundService.class);
                intentService.putExtra(SoundService.ACTION, SoundService.ACTION_CREATE);
                this.getActivity().startService(intentService);
            }
            else 
            {
            	preference.setSummary(R.string.pref_disable_sum);
            	preference.setIcon(R.drawable.off);
            }
            preference.setOnPreferenceClickListener(new EnableClick(this.getActivity()));
        }
    }
	//=================================================================================================
	//=================================================================================================
    public static final int GET_ADMIN_PERMISSION = 12345;

    public Settings() 
    {
        super();
    }

    public void onActivityResult(int requestCode, int resultCode, Intent data) 
    {
        if (requestCode == GET_ADMIN_PERMISSION) 
        {
            if (resultCode == 0) 
            {
                this.showCancelDialog();
                return;
            }
            if (resultCode == -1) 
            {
                SharedPreferences.Editor editor = this.getSharedPreferences(Settings.SettingsFragment.PREFS, android.content.Context.MODE_PRIVATE).edit();
                editor.putBoolean("screen_enable", true);
                editor.commit();
            }
        }
    }

    protected void onCreate(Bundle savedInstanceState) 
    {
        super.onCreate(savedInstanceState);
        this.setContentView(R.layout.preferences);
    }

    private void showCancelDialog() 
    {
        AlertDialog.Builder builder = new AlertDialog.Builder(((Context)this));
        builder.setMessage(R.string.warning_mesg);
        builder.setPositiveButton(R.string.ok, new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialog, int which) 
            {
                dialog.dismiss();
                SharedPreferences.Editor editor = Settings.this.getSharedPreferences(Settings.SettingsFragment.PREFS, android.content.Context.MODE_PRIVATE).edit();
                editor.putBoolean("screen_enable", false);
                editor.putBoolean("pref_screen", false);
                editor.commit();
            }
        });
        builder.setNegativeButton(android.R.string.cancel, new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialog, int which) 
            {
                dialog.dismiss();
                SettingsFragment.checkPrivileges(Settings.this);
            }
        });
        builder.create().show();
    }
}

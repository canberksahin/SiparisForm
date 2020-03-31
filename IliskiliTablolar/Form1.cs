using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace IliskiliTablolar
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

            SqlConnection con = new SqlConnection("Data Source=DESKTOP-427L4HT;Initial Catalog=DbIliskiliTablolar;Integrated Security=True");

        private void Form1_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'dbIliskiliTablolarDataSet.CokluIliskiler' table. You can move, or remove it, as needed.
            this.cokluIliskilerTableAdapter.Fill(this.dbIliskiliTablolarDataSet.CokluIliskiler);
            UrunleriCek();
            MusterileriCek();
            PersonelleriCek();

        }

        private void PersonelleriCek()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select AD from PERSONEL", con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                cmbPersonel.Items.Add(dr[0]);
            }
            con.Close();
        }

        private void btnUrunEkle_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into Urunler (AD,STOK,ALISFIYAT,SATISFIYAT) values(@p1,@p2,@p3,@p4)",con);
            cmd.Parameters.AddWithValue("@p1", txtUrunAd.Text);
            cmd.Parameters.AddWithValue("@p2", nudStok.Value);
            cmd.Parameters.AddWithValue("@p3", txtAlısFiyat.Text);
            cmd.Parameters.AddWithValue("@p4", txtSatisFiyat.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            txtAlısFiyat.Clear();
            txtSatisFiyat.Clear();
            nudStok.Value = 0;
            txtUrunAd.Clear();
            MessageBox.Show("Ürün başarıyla eklenmiştir.","Bilgilendirme",MessageBoxButtons.OK,MessageBoxIcon.Information);
            UrunleriCek();
        }

        private void UrunleriCek()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select AD from URUNLER", con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                cmbUrunAd.Items.Add(dr[0]);
            }
            con.Close();
        }

        private void btnMüsteriEkle_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into Musteriler (ADSOYAD) values(@p1)",con);
            cmd.Parameters.AddWithValue("@p1", txtAdSoyad.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            txtAdSoyad.Clear();
            MessageBox.Show("Müşteri başarılı bir şekilde eklenmiştir","Bilgilendirme",MessageBoxButtons.OK,MessageBoxIcon.Information);
            MusterileriCek();
        }

        private void MusterileriCek()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select ADSOYAD from MUSTERİLER", con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                cmbMusteri.Items.Add(dr[0]);
            }
            con.Close();
        }

        private void btnSipEkle_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into Hareket (URUN,PERSONEL,MUSTERİ,FIYAT) values(@p1,@p2,@p3,@p4)",con);
            cmd.Parameters.AddWithValue("@p1", cmbUrunAd.SelectedIndex+1);
            cmd.Parameters.AddWithValue("@p2", cmbPersonel.SelectedIndex+1); ;
            cmd.Parameters.AddWithValue("@p3", cmbMusteri.SelectedIndex+1);
            cmd.Parameters.AddWithValue("@p4", txtYeniSipFiyat.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            cmbMusteri.SelectedIndex = 0;
            cmbPersonel.SelectedIndex = 0;
            cmbUrunAd.SelectedIndex = 0;
            txtYeniSipFiyat.Clear();

            this.cokluIliskilerTableAdapter.Fill(this.dbIliskiliTablolarDataSet.CokluIliskiler);
        }

        private void btnPerEkle_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into Personel (AD) values(@p1)", con);
            cmd.Parameters.AddWithValue("@p1", txtPer.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            txtPer.Clear();
            MessageBox.Show("Personel başarılı bir şekilde eklenmiştir", "Bilgilendirme", MessageBoxButtons.OK, MessageBoxIcon.Information);
            PersonelleriCek();
        }
    }
}

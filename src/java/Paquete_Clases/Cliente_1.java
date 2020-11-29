/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Paquete_Clases;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author maste
 */
@Entity
@Table(name = "cliente", catalog = "CarritoCompras", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Cliente_1.findAll", query = "SELECT c FROM Cliente_1 c")
    , @NamedQuery(name = "Cliente_1.findByIDcli", query = "SELECT c FROM Cliente_1 c WHERE c.iDcli = :iDcli")
    , @NamedQuery(name = "Cliente_1.findByNombreCli", query = "SELECT c FROM Cliente_1 c WHERE c.nombreCli = :nombreCli")
    , @NamedQuery(name = "Cliente_1.findByAppatCli", query = "SELECT c FROM Cliente_1 c WHERE c.appatCli = :appatCli")
    , @NamedQuery(name = "Cliente_1.findByApmatCli", query = "SELECT c FROM Cliente_1 c WHERE c.apmatCli = :apmatCli")
    , @NamedQuery(name = "Cliente_1.findByFechaNacimientoCli", query = "SELECT c FROM Cliente_1 c WHERE c.fechaNacimientoCli = :fechaNacimientoCli")
    , @NamedQuery(name = "Cliente_1.findByUsernameCli", query = "SELECT c FROM Cliente_1 c WHERE c.usernameCli = :usernameCli")
    , @NamedQuery(name = "Cliente_1.findByPasswordCli", query = "SELECT c FROM Cliente_1 c WHERE c.passwordCli = :passwordCli")
    , @NamedQuery(name = "Cliente_1.findByCelCli", query = "SELECT c FROM Cliente_1 c WHERE c.celCli = :celCli")
    , @NamedQuery(name = "Cliente_1.findByTelCli", query = "SELECT c FROM Cliente_1 c WHERE c.telCli = :telCli")})
public class Cliente_1 implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID_cli")
    private Integer iDcli;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "nombre_cli")
    private String nombreCli;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "appat_cli")
    private String appatCli;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "apmat_cli")
    private String apmatCli;
    @Column(name = "fecha_nacimiento_cli")
    @Temporal(TemporalType.DATE)
    private Date fechaNacimientoCli;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "username_cli")
    private String usernameCli;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "password_cli")
    private String passwordCli;
    @Size(max = 12)
    @Column(name = "cel_cli")
    private String celCli;
    @Size(max = 12)
    @Column(name = "tel_cli")
    private String telCli;

    public Cliente_1() {
    }

    public Cliente_1(Integer iDcli) {
        this.iDcli = iDcli;
    }

    public Cliente_1(Integer iDcli, String nombreCli, String appatCli, String apmatCli, String usernameCli, String passwordCli) {
        this.iDcli = iDcli;
        this.nombreCli = nombreCli;
        this.appatCli = appatCli;
        this.apmatCli = apmatCli;
        this.usernameCli = usernameCli;
        this.passwordCli = passwordCli;
    }

    public Integer getIDcli() {
        return iDcli;
    }

    public void setIDcli(Integer iDcli) {
        this.iDcli = iDcli;
    }

    public String getNombreCli() {
        return nombreCli;
    }

    public void setNombreCli(String nombreCli) {
        this.nombreCli = nombreCli;
    }

    public String getAppatCli() {
        return appatCli;
    }

    public void setAppatCli(String appatCli) {
        this.appatCli = appatCli;
    }

    public String getApmatCli() {
        return apmatCli;
    }

    public void setApmatCli(String apmatCli) {
        this.apmatCli = apmatCli;
    }

    public Date getFechaNacimientoCli() {
        return fechaNacimientoCli;
    }

    public void setFechaNacimientoCli(Date fechaNacimientoCli) {
        this.fechaNacimientoCli = fechaNacimientoCli;
    }

    public String getUsernameCli() {
        return usernameCli;
    }

    public void setUsernameCli(String usernameCli) {
        this.usernameCli = usernameCli;
    }

    public String getPasswordCli() {
        return passwordCli;
    }

    public void setPasswordCli(String passwordCli) {
        this.passwordCli = passwordCli;
    }

    public String getCelCli() {
        return celCli;
    }

    public void setCelCli(String celCli) {
        this.celCli = celCli;
    }

    public String getTelCli() {
        return telCli;
    }

    public void setTelCli(String telCli) {
        this.telCli = telCli;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (iDcli != null ? iDcli.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Cliente_1)) {
            return false;
        }
        Cliente_1 other = (Cliente_1) object;
        if ((this.iDcli == null && other.iDcli != null) || (this.iDcli != null && !this.iDcli.equals(other.iDcli))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Paquete_Clases.Cliente_1[ iDcli=" + iDcli + " ]";
    }
    
}

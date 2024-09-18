---
title: resolve storage related
---

To add the resources **`VolumeSnapshotContent`** and **`VolumeSnapshotClass`** to your **MicroK8s** cluster, you'll need to ensure that the **VolumeSnapshot** feature is supported and enabled in your Kubernetes environment. These resources are part of the Kubernetes **CSI Snapshot** feature, which became stable in Kubernetes 1.20. Here's a step-by-step guide to enable and configure these resources in **MicroK8s**:

### Step 1: Ensure Kubernetes Version is Compatible

`VolumeSnapshotContent` and `VolumeSnapshotClass` are part of the **Kubernetes CSI Snapshot** feature, which requires a compatible version of Kubernetes (1.20 or newer).

First, check your MicroK8s Kubernetes version:

```bash
microk8s kubectl version
```

If your Kubernetes version is lower than 1.20, consider upgrading MicroK8s to a newer version:

```bash
sudo snap refresh microk8s --channel=latest/stable
```

### Step 2: Enable CSI Snapshot Feature in MicroK8s

The `VolumeSnapshotContent` and `VolumeSnapshotClass` resources require a CSI driver with snapshot capabilities. MicroK8s does not ship a CSI snapshot controller by default, but you can install the external snapshot controller and CRDs manually. Follow these steps to add the necessary CRDs and controllers.

#### 2.1. Install Snapshot Controller CRDs

Kubernetes requires the `VolumeSnapshot` CRDs to be installed before you can use snapshot resources. You can manually install these CRDs by applying the following:

```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes-csi/external-snapshotter/v6.0.1/client/config/crd/snapshot.storage.k8s.io_volumesnapshotclasses.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes-csi/external-snapshotter/v6.0.1/client/config/crd/snapshot.storage.k8s.io_volumesnapshotcontents.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes-csi/external-snapshotter/v6.0.1/client/config/crd/snapshot.storage.k8s.io_volumesnapshots.yaml
```

These CRDs define the following custom resources:

- `VolumeSnapshot`
- `VolumeSnapshotContent`
- `VolumeSnapshotClass`

#### 2.2. Install the Snapshot Controller

The CSI Snapshot feature also requires an external snapshot controller to manage volume snapshots. You can install the external snapshot controller using the following manifest:

```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes-csi/external-snapshotter/v6.0.1/deploy/kubernetes/snapshot-controller/rbac-snapshot-controller.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes-csi/external-snapshotter/v6.0.1/deploy/kubernetes/snapshot-controller/setup-snapshot-controller.yaml
```

This will deploy the CSI Snapshot Controller in the `kube-system` namespace.

### Step 3: Create `VolumeSnapshotClass`

Once the necessary CRDs and controllers are in place, you can create a `VolumeSnapshotClass` to define the snapshot behavior for a specific CSI driver. Here's an example `VolumeSnapshotClass` for a CSI driver that supports snapshots:

```yaml
apiVersion: snapshot.storage.k8s.io/v1
kind: VolumeSnapshotClass
metadata:
  name: csi-snapshot-class
driver: csi-driver-name # Replace with your CSI driver name
deletionPolicy: Delete
```

In the `driver` field, replace `csi-driver-name` with the name of the CSI driver you're using (such as `csi-hostpath` or any other CSI driver that supports snapshots).

Apply the `VolumeSnapshotClass` resource:

```bash
kubectl apply -f volumesnapshotclass.yaml
```

### Step 4: Create `VolumeSnapshotContent`

The `VolumeSnapshotContent` resource represents the actual snapshot created from a persistent volume (PV). You can either create a **pre-provisioned** or **dynamic** snapshot.

#### Example of Pre-Provisioned `VolumeSnapshotContent`

```yaml
apiVersion: snapshot.storage.k8s.io/v1
kind: VolumeSnapshotContent
metadata:
  name: snapshot-content-1
spec:
  deletionPolicy: Delete
  driver: csi-driver-name # Replace with your CSI driver name
  source:
    snapshotHandle: snapshot-id # Replace with the ID of the pre-provisioned snapshot
  volumeSnapshotRef:
    name: snapshot-1
    namespace: default
```

In this example:

- Replace `csi-driver-name` with the name of your CSI driver.
- Replace `snapshot-id` with the actual snapshot ID from your storage backend.
- Replace `snapshot-1` with the name of the corresponding `VolumeSnapshot` resource.

Apply this resource:

```bash
kubectl apply -f volumesnapshotcontent.yaml
```

### Step 5: Create `VolumeSnapshot` (For Dynamic Snapshots)

If you want to dynamically create snapshots from existing Persistent Volume Claims (PVCs), you can create a `VolumeSnapshot` resource. This assumes your CSI driver supports dynamic snapshot creation.

Here’s an example:

```yaml
apiVersion: snapshot.storage.k8s.io/v1
kind: VolumeSnapshot
metadata:
  name: my-snapshot
  namespace: default
spec:
  volumeSnapshotClassName: csi-snapshot-class # Replace with your VolumeSnapshotClass name
  source:
    persistentVolumeClaimName: my-pvc # Replace with the PVC you want to snapshot
```

Apply the `VolumeSnapshot` resource:

```bash
kubectl apply -f volumesnapshot.yaml
```

After this, a snapshot will be created for the specified PVC, and Kubernetes will automatically manage the `VolumeSnapshotContent` resource in the background.

### Step 6: Verify Snapshot Resources

After creating the snapshot resources, you can verify that everything is working by checking the status of the resources:

```bash
kubectl get volumesnapshotclass
kubectl get volumesnapshot
kubectl get volumesnapshotcontent
```

You should see the `VolumeSnapshotClass`, `VolumeSnapshot`, and `VolumeSnapshotContent` resources if everything is set up correctly.

---

### Summary of Key Steps

1. Ensure you're using Kubernetes 1.20+ in MicroK8s.
2. Install the CSI Snapshot CRDs.
3. Deploy the external Snapshot Controller.
4. Create a `VolumeSnapshotClass` for your CSI driver.
5. Create `VolumeSnapshotContent` for pre-provisioned snapshots or `VolumeSnapshot` for dynamic snapshots.
6. Verify that the snapshots are working correctly using `kubectl get` commands.

By following these steps, you will add the `VolumeSnapshotContent` and `VolumeSnapshotClass` resources to your MicroK8s cluster and enable snapshot capabilities for your storage.
